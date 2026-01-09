# 🗄️ Système de Gestion de Base de Données Relationnelle (PostgreSQL)

## Contexte du Projet
Réalisé dans le cadre du **Master 1 MBFA** (Université Lumière Lyon 2), ce projet consiste à concevoir et implémenter une architecture de base de données complète pour la gestion opérationnelle d'une structure (Cas d'étude : Salle de Sport).

## Stack Technique
- **SGBD :** PostgreSQL
- **Outil de gestion :** DBeaver
- **Modélisation :** UML (Diagramme de classes), Schéma Relationnel (MLD)

## Étapes de Réalisation
1. **Analyse du besoin :** Définition des entités (Adhérents, Abonnements, Coachs, Cours) et des règles métiers.
2. **Modélisation Conceptuelle :** Création du diagramme UML pour structurer les relations.
3. **Implémentation SQL :** - Création des tables avec contraintes d'intégrité (Clés primaires, étrangères).
    - Peuplement de la base via des scripts DML (`INSERT INTO`).
    - Développement de requêtes d'analyse pour l'extraction de KPI.

## Exemples de Requêtes Analytiques
Le projet inclut des requêtes complexes permettant de piloter l'activité :
- Suivi chronologique du planning des cours via des **JOINS**.
- Analyse du chiffre d'affaires par type d'abonnement.
- Gestion des flux de réservations et de l'assiduité.
