# Captain Morgans Relationships

### Goals

* Implement Core Data with only general instructions for relationships and attributes of entities.
* Visualize saved content from Core Data.
* Add and persistently store data to Core Data.s

## Instructions

  0. The storyboard has been started for you. Create class files to match those designated for each of the View Controllers.
  1. Create a new `.xcdatamodeld` file.
  2. Create three entities with attributes and relationships: `Pirate`, `Ship`, `Engine`.
    * `Pirate`s have one name and many `Ship`s.
    * Ships have one `Pirate`, one `Engine`, and a name.
    * `Engine`s have a `String` attribute describing its propulsion type (i.e. sail, gas, or electric) and one `Ship`. 
  3. Create a `DataStore` and write the implementation for the standard functions, as well as `generateTestData()` and `fetchData()`.  
  4. In the class files for your view controllers, make sure all relevant information for your `Pirate`s and `Ship`s appears appropriately.

## Advanced

  1. Add two plus `UIBarButtonItem`s. One on `PiratesViewController` and one on `ShipsViewController`. When you click the plus it should modally present a new view controller that allows the user to add a either new pirate, or a new ship (which needs an engine and should be associated with a pirate!) to the database.

<p data-visibility='hidden'>View <a href='https://learn.co/lessons/swift-captain-morgans-relationships-lab' title='Swift Captain Morgans Relationships Lab'>Captain Morgans Relationships</a> on Learn.co and start learning to code for free.</p>
