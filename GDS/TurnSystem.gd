# TurnSystem.gd
extends Node
var current_character: Node  # 可以是 Player 或 AIEnemy
var player: Player
var enemy: AIEnemy
var turn_count: int = 0
const MAX_TURNS: int = 3  # 每个角色的最大回合数

func start_battle(p_player: Player, p_enemy: AIEnemy) -> void:
	player = p_player
	enemy = p_enemy
	current_character = player
	turn_count = 0
	start_turn()

func start_turn() -> void:
	turn_count += 1
	if turn_count > MAX_TURNS:
		end_battle()
		return
	
	current_character.update_status()  # 更新角色状态（如眩晕）
	
	if current_character == player:
		player_turn()
	elif current_character == enemy:
		enemy_turn()

func player_turn() -> void:
	print("玩家回合开始")
	player.draw_card()
	# 这里应该有等待玩家操作的逻辑
	# 为了演示，我们假设玩家总是打出第一张手牌
	if not player.hand.is_empty() and not player.is_stunned:
		var card = player.hand[0]
		player.play_card(card, enemy)
	end_turn()

func enemy_turn() -> void:
	print("敌人回合开始")
	enemy.draw_card()
	# 简单的AI逻辑：总是打出第一张手牌
	if not enemy.hand.is_empty() and not enemy.is_stunned:
		var card = enemy.hand[0]
		enemy.play_card(card, player)
	end_turn()

func end_turn() -> void:
	EventSystem.turn_ended.emit(current_character)
	if current_character == player:
		current_character = enemy
	else:
		current_character = player
	start_turn()

func end_battle() -> void:
	print("战斗结束")
	# 这里可以添加决定胜负的逻辑
	if player.health > enemy.health:
		print("玩家获胜！")
	elif enemy.health > player.health:
		print("敌人获胜！")
	else:
		print("平局！")
	GameManager.change_state(GameManager.GameState.BATTLE_END)
