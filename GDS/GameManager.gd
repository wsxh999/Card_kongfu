
# GameManager.gd
extends Node

enum GameState {MAIN_MENU, BATTLE_PREP, IN_BATTLE, BATTLE_END}
var current_state: GameState = GameState.MAIN_MENU
var player: Player
var enemy: AIEnemy

func _ready() -> void:
	player = Player.new()
	enemy = AIEnemy.new()

func change_state(new_state: GameState) -> void:
	current_state = new_state
	match current_state:
		GameState.MAIN_MENU:
			print("进入主菜单")
		GameState.BATTLE_PREP:
			print("准备战斗")
		GameState.IN_BATTLE:
			print("战斗开始")
			# 假设 TurnSystem 是一个自动加载的脚本
			TurnSystem.start_battle(player, enemy)
		GameState.BATTLE_END:
			print("战斗结束")

func get_player() -> Player:
	return player

func get_enemy() -> AIEnemy:
	return enemy
	

