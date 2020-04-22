# Gestion d'un objet de type KinematicBody servant pour gérer un joueur.
extends KinematicBody


# Sert pour la vélocité du personnage sur la scène.
var velocite
# Sert à gérer la vitesse du personnage.
var vitesse

# Gestion de la gestion d'un objet pour le personnage.
func _physics_process(delta):
		# Sert pour la vélocité du personnage sur la scène.
	velocite = Vector3()
	# Récupére la valeur de la velocité sur l'axe y.
	var velocite_y = velocite.y
	
	# Si la touche Shift est appuyée, on augmente la vitesse du personnage.
	if Input.is_action_pressed("ui_touche_shift"):
		vitesse = 500
	else:
		vitesse = 100
	
	# Si la flèche haut est appuyée, on transforme le vecteur de la velocité pour l'axe Z.
	if Input.is_action_pressed("ui_up"):
		velocite += -transform.basis.z * vitesse * delta
	# Si la flèche bas est appuyée, on transforme le vecteur de la velocité pour l'axe Z.
	elif Input.is_action_pressed("ui_down"):
		velocite += transform.basis.z * vitesse	* delta
	# Si la flèche gauche est appuyée, on transforme le vecteur de la velocité pour l'axe X.
	elif Input.is_action_pressed("ui_left"):
		velocite += -transform.basis.x * vitesse * delta
	# Si la flèche droite est appuyée, on transforme le vecteur de la velocité pour l'axe X.
	elif Input.is_action_pressed("ui_right"):
		velocite += transform.basis.x * vitesse * delta
	# Récupère la velocité de y de départ puisque le vecteur a été modifié à cause des lignes précédentes.
	velocite.y = velocite_y
	# Déplacement du personnage selon la velocite.
	move_and_slide(velocite)
		
# Gestion du mouvement de la souris.
func _unhandled_input(event):
	# Si un mouvement de la souris est détectée, on effectue une rotation du personnage.
	if event is InputEventMouseMotion:
		rotate_y(-lerp(0, 0.1, event.relative.x/10))
	
	
	
