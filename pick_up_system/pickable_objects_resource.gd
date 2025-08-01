extends Resource
class_name pickable_object_resource

## Das Standard Aussehen des Objektes
@export var base_texture : Texture2D
## Wie groß die Box ist in welcher der Spieler stehen muss um das Objekt aufzuheben
@export var interact_box_size : Vector2
## Wie lange es dauert das Objekt hochzuheben
@export var pickup_time : float = 0.3

enum rarity_enum {common, rare, ultra_rare}
@export var rarity: rarity_enum
