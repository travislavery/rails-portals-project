class Quest{
	constructor(jsonQuest){
		this.id = jsonQuest['id']
		this.title = jsonQuest['title']
		this.karma_impact = jsonQuest['karma_impact']
		this.priority = jsonQuest['priority']
		this.portal = jsonQuest['portal']['location']
		this.users = jsonQuest['users'].map(user=> user['name']).join(', ')
	}

	convertToHtml(){
		let questHtml = ""
		questHtml += `<a id='quest-${this.id}' href='/quests/${this.id}'><h2>${this.title}</h2></a>`
		questHtml += `<p>Portal: ${this.portal}</p>`
		questHtml += `<p>Karma Impact: ${this.karma_impact}</p>`
		questHtml += `<p>Priority: ${this.priority}</p>`
		questHtml += `<p>Participants: ${this.users}</p>`
		return questHtml
	}

	addMultipleToPage(element){
		//debugger
		$(element).append(this.convertToHtml.bind(this))
	}

	addSingleToPage(element){
		$(element).html(this.convertToHtml.bind(this))
	}
}

$(document).on('turbolinks:load', function(){
	attachListeners()
})

function attachListeners(){
	$('.viewQuests').on('click', getQuestJson)
	$('#accordian').on('click', hideOrShowQuests)
}

function getQuestJson(){
	$('#accordian')[0].style.display = 'block'
	$('#quests')[0].style.display = 'block'
	$('#viewQuests')[0].style.display = 'none'
	$.getJSON(`/portals/${this.dataset.id}/quests`, function(data){
		const quests = data.map(quest => new Quest(quest))
		addQuestsToPage(quests)
	})
}

function addQuestsToPage(quests){
	$('#quests').html("")
	quests.forEach(function(quest){
		quest.addMultipleToPage('#quests')
	})
}

function hideOrShowQuests(){
	$quests = $('#quests')[0]
	if ($quests.style.display === 'none'){
		$quests.style.display = 'block'
	} else {
		$quests.style.display = 'none'
	}
}