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
			
			_entities.remove(entityDel);
			if(contains(entityDel)) removeChild(entityDel);
			entityDel = null;
			
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
	
	// ajout d'une entite dans le calque
	public function addEntity(entity:Entity):Void
	{
		
		addChild(entity);
		entity.addEventListener(EntityEvent.DESTROYED, _entityDestroyed);
		
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