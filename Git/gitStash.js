//----- Guarda en un stash inclusive con archivos nuevos
git stash -u

//----- Crear un stash con nombre "intellij files"
git stash save "intellij files".

//----- Listar  stash guardados
	$ git stash list
		stash@{0}: On GP2884: intellij files
		stash@{1}: WIP on RQ1246: 58a3f129 CORRECCION MANTIS: 0001292 ERROR NOMENCLATURA DE FIRMA V1.5
		stash@{2}: WIP on master: 936aa969 Merge branch 'hotfix/GP2876' into master 1096ee7
		
//----- Aplicar un stash en particular
		git stash apply stash@{0}
