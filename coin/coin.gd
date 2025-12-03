extends Area2D

func _on_body_entered(_body):
	$collect_sound.play()
	
	Global.score += 1
	Global.coins += 1

	$Coin.queue_free()
	$collision.queue_free()

	await $collect_sound.finished
	queue_free()
