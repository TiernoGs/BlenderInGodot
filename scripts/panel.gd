extends Panel

var originalMousePosition : Vector2
var movedMousePosition : Vector2
var deltaMousePosition : Vector2

var isInHBoxContainer : bool
var isInVBoxContainer : bool

enum Direction { VERTICAL, HORIZONTAL }

func _ready():
    set_modulate(Color(randf(), randf(), randf()))
    isInHBoxContainer = false
    isInVBoxContainer = false


func _on_Button_button_down() -> void:
    originalMousePosition = get_global_mouse_position()


func _on_Button_button_up() -> void:
    movedMousePosition = get_global_mouse_position()
    _calcVector2Diff()
    var direction = _getDeltaDirection()
    print(_getDeltaDirection())
    Global._addInBoxContainer(
        isInHBoxContainer,
        isInVBoxContainer,
        direction,
        get_parent(),
        self)
    match direction:
        VERTICAL:
            self.size_flags_stretch_ratio = 1 - deltaMousePosition.y / get_viewport_rect().size.y
        HORIZONTAL:
            self.size_flags_stretch_ratio = 1 - deltaMousePosition.x / get_viewport_rect().size.x
        
    
        
func _calcVector2Diff():
    deltaMousePosition = originalMousePosition - movedMousePosition
    #deltaMousePosition = deltaMousePosition.normalized()


func _getDeltaDirection():
    if(abs(deltaMousePosition.x) > abs(deltaMousePosition.y)):
        return Direction.VERTICAL
    else:
        return Direction.HORIZONTAL   
