$(document).on('turbolinks:load', function(){
	attachPortalListeners()
})

function attachPortalListeners(){
	$('.nextPortal').on('click', setNextPortal)
	$('.previousPortal').on('click', setPreviousPortal)
}

function setPreviousPortal(){
	let previousPortalId = parseInt(this.dataset.portal)-1
	if (previousPortalId < 0){
		previousPortalId = parseInt(this.dataset.maximum)
	} 
	requestPortal(previousPortalId)
}

function setNextPortal(){
	let nextPortalId = parseInt(this.dataset.portal)+1
	if (previousPortalId > parseInt(this.dataset.maximum)){
		previousPortalId = 0
	} 
	requestPortal(nextPortalId)
}

function requestPortal(nextUp){
	$.getJSON(`/portals/${nextUp}`, function(data){	
		const portal = new Portal(data)
		portal.viewPortal()
	})
}