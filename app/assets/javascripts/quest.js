class Quest{
	constructor(jsonQuest){
		this.id = jsonQuest['id']
		this.title = jsonQuest['title']
		this.karma_impact = jsonQuest['karma_impact']
		this.portal = jsonQuest['portal']['location']
		this.users = jsonQuest['users'].map(user=> user['name']).join(', ')
		
	}
	addToIndex(){
		let questHtml = ""
		questHtml += `<a id='quest-${this.id}' href='/quests/${this.id}'><h2>${this.title}</h2></a>`
		questHtml += `<p>Portal: ${this.portal}</p>`
		questHtml += `<p>Karma Impact: ${this.karma_impact}</p>`
		questHtml += `<p>Participants: ${this.users}</p>`
		debugger
		$('#quests').append(questHtml)
	}

	addToShow(){

	}
}

$(function(){
	attachListeners()
})

function attachListeners(){
	$('.viewQuests').on('click', getQuestJson)
}

function getQuestJson(){
	$.getJSON(`/portals/${this.dataset.id}/quests`, function(data){
		const quests = data.map(quest => new Quest(quest))
		addQuestsToPage(quests)
	})
}

function addQuestsToPage(quests){
	$('#quests').html("")
	quests.forEach(function(quest){
		quest.addToIndex()
	})
}