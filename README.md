<div align="center">
    <img src="https://i.ibb.co/23KyxTn/votingbanner.png">
</div>

# A better way to hold elections.

## [Preview](https://youtu.be/ooFx5rXbvbs)

## Dependencies
* [Latest Version of QBCore](https://github.com/qbcore-framework)
* [PolyZone](https://github.com/mkafrin/PolyZone)
* [qb-menu](https://github.com/qbcore-framework/qb-menu)
* [oxmysql](https://github.com/overextended/oxmysql)

## Installation
* Download the ZIP file and extract it in your resources folder
* Add ensure `cx-voting` to your `server.cfg`
* Run the `Voting.sql` file
* Configure (add/remove) your candidates in `shared/config.lua`

## To build ( Only if you make changes to the `web` folder )
### Prerequisites
* [Node > v10.6](https://nodejs.org/en/)

### Building
* First, open cx-voting/web in a terminal of your choice
* Now write these commands in your terminal: 
    * npm i
    * npm run build
