package com.webravenz.ld26.display;
import com.webravenz.ld26.events.EntityEvent;

/**
 * ...
 * @author Webravenz
 */

class EntitiesLayer extends ASprite
{
	
	private var _entities:Array<Entity>;
	private var _entitiesToDelete:Array<Entity>;

	public function new() 
	{
		
		super();
		
		_entities = new Array<Entity>();
		_entitiesToDelete = new Array<Entity>();
		
	}
	
	public function update():Void {
		
		for (entityDel in _entitiesToDelete) {
			_removeEntity(entityDel);
		}
		
		_entitiesToDelete = new Array<Entity>();
		
		for (entity in _entities) {
			
			if(entity != null) {
			
				entity.update();
				
				if(entity.collisionCheck) {
					_checkCollisions(entity);
					
					entity.checkCollisions();
				}
			
			}
			
		}
		
	}
	
	public function clear():Void {
		for (entityDel in _entities) {
			_removeEntity(entityDel);
		}
	}
	
	private function _removeEntity(entity:Entity):Void {
		
		entity.removeEventListener(EntityEvent.DESTROYED, _entityDestroyed);
		_entities.remove(entity);
		if(contains(entity)) removeChild(entity);
		entity = null;
		
	}
	
	// ajout d'une entite dans le calque
	public function addEntity(entity:Entity):Void
	{
		
		addChildAt(entity, 0);
		entity.addEventListener(EntityEvent.DESTROYED, _entityDestroyed);
		entity.layer = this;
		
		_entities.push(entity);
		
	}
	
	// suppression d'une entite
	private function _entityDestroyed(e:EntityEvent):Void 
	{
		
		_entitiesToDelete.push(e.currentTarget);
		
	}
	
	// verif des collisions sur une entite
	private function _checkCollisions(entity:Entity):Void {
		
		entity.collides = new Array<Entity>();
		
		// verif sur toutes les entites, qui ne sont pas du meme groupe
		for (entityCheck in _entities) {
			
			if (entityCheck.getCollideGroup() != 0 && entity.getCollideGroup() != entityCheck.getCollideGroup()) {
				
				if (entity.getArea().intersects(entityCheck.getArea())) {
					entity.collides.push(entityCheck);
				}
				
			}
			
		}
		
	}
	
}