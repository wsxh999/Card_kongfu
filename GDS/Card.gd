# Card.gd
extends Resource
class_name Card
@export var id: int
@export var card_name: String
@export var description: String
@export var card_type: String
@export var damage: int = 0
@export var heal: int = 0
@export var stun_duration: int = 0

func _init(p_id: int = 0, p_name: String = "", p_description: String = "", p_type: String = "", p_damage: int = 0, p_heal: int = 0, p_stun_duration: int = 0):
	id = p_id
	card_name = p_name
	description = p_description
	card_type = p_type
	damage = p_damage
	heal = p_heal
	stun_duration = p_stun_duration

func play(player, target):
	print(card_name + " 被打出")
	# 应用伤害
	if damage > 0:
		target.take_damage(damage)
	# 应用治疗
	if heal > 0:
		player.heal(heal)
	# 应用眩晕
	if stun_duration > 0:
		target.apply_stun(stun_duration)
	# 触发卡牌使用事件
	EventSystem.card_played.emit(self, player, target)

