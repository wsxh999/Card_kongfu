# AIEnemy.gd
extends Node
class_name AIEnemy

var health: int = 100
var energy: int = 50
var hand: Array[Card] = []
var deck: Array[Card] = []
var is_stunned: bool = false
var stun_duration: int = 0

func _init():
	# 初始化 deck 为空数组
	deck = []

func draw_card() -> void:
	if deck.size() > 0:
		var card = deck.pop_back()
		hand.append(card)
		print(self.name + " 抽了一张牌: " + card.card_name)

func play_card(card: Card, target) -> void:
	if card in hand and not is_stunned:
		hand.erase(card)
		card.play(self, target)
	elif is_stunned:
		print(self.name + " 处于眩晕状态，无法使用卡牌")

func take_damage(amount: int) -> void:
	health -= amount
	print(self.name + " 受到了 " + str(amount) + " 点伤害")
	EventSystem.damage_dealt.emit(self, amount)

func heal(amount: int) -> void:
	health += amount
	print(self.name + " 恢复了 " + str(amount) + " 点生命值")

func apply_stun(duration: int) -> void:
	is_stunned = true
	stun_duration = duration
	print(self.name + " 被眩晕了 " + str(duration) + " 回合")

func update_status() -> void:
	if is_stunned:
		stun_duration -= 1
		if stun_duration <= 0:
			is_stunned = false
			print(self.name + " 已经从眩晕状态恢复")

func set_deck(new_deck: Array[Card]):
	deck = new_deck

# AI特有的决策方法
func make_decision() -> void:
	# 这里可以添加AI的决策逻辑
	print(self.name + " 正在思考下一步行动...")

