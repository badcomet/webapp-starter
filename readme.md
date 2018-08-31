#Carte interactive MVP

##Concept 

Une carte web qui permet de montrer différents endroits ou éléments constitutifs de thecamp. 
On peut y montrer les salles ‘normales’ (bar, restaurant, installations sportives, etc.), mais plus largement, l’objectif est de pouvoir documenter et mettre en avant les différents projets du site (partenaires d’expérimentation, développement durable, etc.).  On peut même y montrer certains projets Urban Lab (solar camp, demoiselle). 
Besoin urgent pour : Nolwen (DD), Florence (Inspire tour), Arthur (CoCoDE), Urbanlab (solar camp) ou n’importe qui qui fait des visites. Besoin aussi pour projet Winwin (mai).  
Permet aussi de montrer certains éléments ‘en projet’, pour faire comprendre que le campus est en évolution. 

##Principe

###Dans les grandes lignes 

La navigation permet de masquer ou faire apparaitre des éléments sur la carte SVG. Cliquer sur un marqueur permet de faire apparaitre les informations pertinentes. 

### Dans les faits 

- La carte est générée sur Illustrator et exportée en seul SVG 
- Chaque pastille orange est un groupe nommé avec un **id unique (important)** 
- La carte est exportée en SVG 
- Le SVG est injecté dans le html via javascript 
- Les contenus sont importés depuis les "places" du contenthub de prod (https://thecamp.fr/api/places)


### Pour ajouter un nouvel élément 

1. Mettre à jour le SVG dans illusrator (app/public/static/map.svg) en ajoutant un point en nommant le groupe avec l'id du lieu (attention aux doublons) 
2. Exporter le SVG avec les propriétés standard
3. Ajouter une "Place" dans le contenthub en prod, checker que la place est bien sur la map en local
3. Commiter, pusher les modifs (branche origin/development)
4. Créer une PR sur son origin de origin/development vers upstream/development
5. Prier pour un merge en buvant une margarita 

###Points de vigilance 

- S'assurer que l'id du marqueur correspond à l'id qui est rensigné dans la "Place" côté contenthub et surtout qu'il n'est pas déjà utilisé

## How to run development front environment?
Go to app/web/private and enter theses commands (you must have yarn installed : https://yarnpkg.com/en/docs/install#mac-stable) 
```console
# Install dependencies
yarn install

# Run dev environment (compile scss/ES6 and watch)
npm run dev
```


##Contributeurs 
- Marine C: intégration 
- Benjamin P: UX / animations 
- Julien G: UX / graphisme 
- Arthur S: contenus 
- Florence O: contenus 

##Roadmap 
- Add vue.js to use template instead of vanilla JS to inject formated contents from JSON
- Use isotope.js to pop "place card" on grid to better animation render 
- Improve jQuery Localize library to manage translations


## Releases
**v1.1 Content in contenthub & translation**
- Add yarn for manage dependencies
- Add translation for UI & content
- Load content from contenthub 

**v1.0  - features pour la mise en ligne**
- loader avant que la carte arrive 
- pusher le svg en js pour pouvoir le garder séparé 
- scroll to top quand on load un calque ou un POI 
- changer l'ID pour le titre du calque quand le POI est chargé 
- changer couleur du point quand on clique depuis la liste 
- Ajouter metatags / og
- Ajouter tag manager
- Update mobile map en svg
- Minify external ressources
- Ajouter un bouton retour vers thecamp.fr si possible à gauche du menu filtre
- Update logo en format svg ou optimisé (haut gauche) et ajouter un line vers thecamp.fr

##TODO - IDEAS

- Ajouter une mention "Uniquement disponible sur tablet ou desktop pour une meilleur experience" ou equivalent sur mobile avec un lien de retour sur le site corporate
- Revoir le contenu en supprimant des informations trop précises (numero de salle, dates, ... ) afin d'éviter les mises à jour. Ajouter ces infos via un lien "read more"
---------------
- Minify css / js 
- possibilité de zoom / pan sur la carte 
- intégrer les contenus sur le content hub 
- possibilité d'avoir plusieurs images sur un POI
- naviguer d'un élément à l'autre par le volet droit < > 
- ajouter les éléments manquants sur la carte 
- ajouter images manquantes 
- autres parcours (ex. 'activités')
- éléments qui apparaissent quand on zoom (voir toutes les salles B par exemple)
- Possibilité de l’intégrer au planning pour voir en temps réel ce qui se passe sur le campus 
- Animations web sur les différents éléments (éolienne qui tourne, gens qui se déplacent, etc.)
- Capacité de générer des cartes spéciales pour des événements, qui montrent ou cachent certains éléments (ex. pour CoCoDE ou pour Youth camps) 
- Possibilité de faire des animations (ou des nouvelles cartes) en mode zoom (ex. en mode ‘normal’, on voit que les salles B en mode un peu ‘cartoon’ et quand on clique dessus, on voit le découpage des salles de 1 à 12 en mode plus réaliste) 
- La rendre mobile-friendly 
- Vidéos sur POI
