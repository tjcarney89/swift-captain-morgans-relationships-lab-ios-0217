# Captain Morgans Relationships

## Instructions

  0. The storyboard has been started for you. Create class files to match those designated for each of the View Controllers.
  1. Navigate to the `swift_captain_morgans_relationships_lab.xcdatamodeld`.
  2. Create three entities with attributes and relationships: Pirate, Ship, Engine.
    * Pirates have many ships, and a name.
    * Ships have one Pirate, one Engine, and a name.
    * Engines have a `String` attribute describing its propulsion type (i.e. sail, gas, or electric) and one ship. 
  3. Create a `DataStore` and write the implementation for `generateTestData` and `fetchData`.  
  4. Make sure everything shows up!

## Advanced

  1. Add two plus `UIBarButtonItems`. One on `PiratesViewController` and one on `ShipsViewController`. When you click the plus it should modally present a new view controller that allows the user to add a either new pirate, or a new ship (which needs an engine and should be associated with a pirate!) to the database.

<p data-visibility='hidden'>View <a href='https://learn.co/lessons/swift-captain-morgans-relationships-lab' title='Swift Captain Morgans Relationships Lab'>Captain Morgans Relationships</a> on Learn.co and start learning to code for free.</p>
