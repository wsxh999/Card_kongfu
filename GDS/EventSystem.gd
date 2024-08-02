extends Node

signal card_played(card: Card, player: Node, target: Node)
signal damage_dealt(target: Node, amount: int)
signal turn_ended(character: Node)

func _ready() -> void:
	# 连接信号到相应的处理函数
	card_played.connect(_on_card_played)
	damage_dealt.connect(_on_damage_dealt)
	turn_ended.connect(_on_turn_ended)

func _on_card_played(card: Card, player: Node, target: Node) -> void:
	print(player.name + " 打出了 " + card.card_name + " 对 " + target.name)

func _on_damage_dealt(target: Node, amount: int) -> void:
	print(target.name + " 受到了 " + str(amount) + " 点伤害")

func _on_turn_ended(character: Node) -> void:
	print(character.name + " 的回合结束")

