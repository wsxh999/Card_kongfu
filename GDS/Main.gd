# Main.gd
extends Node2D
var player_cards: Array[Card] = []
var enemy_cards: Array[Card] = []

func _ready():
	create_sample_cards()
	setup_battle()

func create_sample_cards():
	# 玩家卡牌
	player_cards.append(Card.new(1, "火球术", "造成10点伤害", "攻击", 10))
	player_cards.append(Card.new(2, "闪电链", "造成5点伤害并眩晕1回合", "攻击", 5, 0, 1))
	player_cards.append(Card.new(3, "生命汲取", "造成2点伤害并恢复10点生命", "攻击", 2, 10))

	# 敌人卡牌
	enemy_cards.append(Card.new(4, "重击", "造成12点伤害", "攻击", 12))
	enemy_cards.append(Card.new(5, "毒刺", "造成3点伤害", "攻击", 3))
	enemy_cards.append(Card.new(6, "狂暴打击", "造成100点伤害", "攻击", 100))

func setup_battle():
	var player = Player.new()
	player.name = "玩家"
	player.deck = player_cards.duplicate()
	
	var enemy = AIEnemy.new()
	enemy.name = "敌人"
	enemy.deck = enemy_cards.duplicate()
	
	GameManager.player = player
	GameManager.enemy = enemy
	
	# 开始战斗
	GameManager.change_state(GameManager.GameState.IN_BATTLE)

