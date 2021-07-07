extends Node

onready var panelObject = preload("res://scenes/defaultPanel.tscn")
onready var hBoxObject = preload("res://scenes/HController.tscn")
onready var vBoxObject = preload("res://scenes/VController.tscn")


func _ready():
    randomize()
    
func reparent(child: Node, newParent: Node):
    var oldParent = child.get_parent()
    oldParent.remove_child(child)
    newParent.add_child(child)
    
func _addInBoxContainer(isInHBox : bool, isInVBox : bool, direction, parent, node):
# warning-ignore:unused_variable
    var root = get_tree().get_root()
    var newPanel = panelObject.instance()
    if(isInHBox and isInVBox):
        pass
    elif(isInHBox):
        pass
    elif(isInVBox):
        pass
    else:
        if(direction == 0): # Horizontal
# warning-ignore:unused_variable
            var hInstance = hBoxObject.instance()
            parent.remove_child(node)
            parent.add_child(hInstance)
            hInstance.add_child(node)
            hInstance.add_child(newPanel)
        else:
            var vInstance = vBoxObject.instance()
            parent.remove_child(node)
            parent.add_child(vInstance)
            vInstance.add_child(node)
            vInstance.add_child(newPanel)
            pass
        pass
        root.print_tree()
    pass
