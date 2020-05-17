// Escenario: Se tiene un repositorio creado en github y se tiene un proyecto creado en local 
// (sin estar versionado, es decir sin el origin) y se requiere que los cambios locales se versionen
*. > git init
1. > git remote add origin aqui_ruta_repositorio_en_git
2. > git add .
3. > git commit -m "creacion inicial desde local"
4. > git pull origin master
5. > git push -f origin master
