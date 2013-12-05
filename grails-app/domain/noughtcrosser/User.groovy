package noughtcrosser

class User {
	String userName
	String password
	String first
	String last
	Integer wins
	Integer losses
	Integer ties
	
	String toString() {
		return first + " " + last
		}
 
	static mappedBy = [challengeGames:"challenger", opponentGames:"opponent"]
	static hasMany = [challengeGames: Game, opponentGames: Game]
	
    static constraints = {
		first blank: false
		last blank: false
		userName blank: false, unique: true
		password blank: false
		wins nullable: true
		losses nullable: true
		ties nullable: true
    }
}
