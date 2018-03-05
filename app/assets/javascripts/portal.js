class Portal{
	constructor(jsonPortal){
		this.id = jsonPortal['id']
		this.location = jsonPortal['location']
		this.god = jsonPortal['user']['name']
	}

	viewPortal(){
		$('#quests').html('')
		$('#portalLocation')[0].innerText = this.location
		$('#portalGod')[0].innerText = this.god
		$('.viewQuests').attr('data-id', this.id)
		$('.nextPortal').attr('data-portal', this.id)
		$('.previousPortal').attr('data-portal', this.id)
	}
}