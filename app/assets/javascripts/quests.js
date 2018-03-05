class Quest{
	constructor(jsonQuest){
		this.id = jsonQuest['id']
		this.title = jsonQuest['title']
		this.description = jsonQuest['description']
		this.karma_impact = jsonQuest['karma_impact']
		this.portal = jsonQuest['portal']['location']
	}
	addToIndex(){
		//const questHtml = `<`
		//$('#quests').append()
	}

	addToShow(){

	}
}