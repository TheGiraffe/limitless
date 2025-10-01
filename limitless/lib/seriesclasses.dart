// General Series Class
class Series {
 const Series({required this.name, required this.elements});
 final String name;
 final List elements; // or items
}

// General Story class
class Story {
  const Story({required this.name});
  final String name;
}

// General Item class
class Item {
  late String elementType;
  late String itemName;
  late String itemPath;
  late String itemDialogueText;
  late dynamic itemDialogueButtons;
  late dynamic elementCriteria;
}

//// ITEM CRITERIA ////

////////////////////////////////////
/// Spell Card Element Criteria ///
///////////////////////////////////

class SpellCardCriteria {
  late String elementType = "Spell Card";
  late String topHeadingTitle;
  late String subtitle;
  late String coverImage;
  late String description;
  late List stories; // List of stories that this spell card appears in. Default is all stories in a series.
  late List spells; // List of all spell objects that can appear on the card.
}

class Spell{
  late String name;
  late String description; // Very short description next to spell name on the spell card.
  late int damage; // Amount of damage this spell causes
  late int cost; // Amount of mana that this spell costs

  // List of adversaries that the spell causes damage to, gives strength to, or has no impact on.
  // {adversary: <adversary name / object>, damage: <either -damage if adversary is healed by it, 0 if nothing, +damage if adversary is damaged by it, or 2x damage & 3x damage for special cases>}
  late List allAdversaryDamages; 

  late List categories; // Categories specific for this spell.
  late List rules; // Rules specific for this spell. 
  // We are probably going to want some nice UI-friendly way of showing the rules for each spell.
  // There can be a lot of spells per card, and they appear on the card semi-randomly depending upon
  // which adversary you are fighting? --> think about this a little more.

  // Should we include some random chaos, where the spell can fizzle or work randomly even when it's not supposed to?
  // Just to make things a little interesting :)
  late double randomChaosProbability; 
}

class AdversaryDamage{
  late dynamic adversary;
  late int damage;
}

/////////////////////////////////
/// Potions Element Criteria ///
////////////////////////////////

class Potion {
  late String elementType = "Potion";
  late String descriptionOfEffects; // The user should write up their own description of the effect.
  late List effects;
}

class PotionEffect{
  var possibleEffects = ["Increase Health", "Increase Damage", "Reincarnate as Sheep"];
  late String effect; // One of the possible effects above.
  // If increasing health, the health will increase by this number.
  // If increasing damage, the damage may be multiplied by this number?
  late int effectValue; 
}

// TODO: Add item criteria for: Charms, Grown Items, Mined Items, and Crafted Items.

//// CHARACTER CRITERIA ////

// General Character class
class Character {
  late String name;
  late String characterType;
  late dynamic details;
}

class CharacterDetails{
  late List dialogue;
  late int totalHealth;
}

// Adversaries and NPC Questgivers here

/////////////////////////////
/// Adversaries Criteria ///
///////////////////////////


/////////////////////////////////
/// NPC Questgivers Criteria ///
////////////////////////////////