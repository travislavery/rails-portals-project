$(document).on('turbolinks:load', function(){
	attachPortalListeners()
})

function attachPortalListeners(){
	$('.nextPortal').on('click', setNextPortal)
	$('.previousPortal').on('click', setPreviousPortal)
}

function setPreviousPortal(){
	let previousPortalId = parseInt(this.dataset.portal)-1
	if (previousPortalId < 1){
		previousPortalId = parseInt(this.dataset.maximum)
	} 
	requestPortal(previousPortalId)
}

function setNextPortal(){
	let nextPortalId = parseInt(this.dataset.portal)+1
	if (nextPortalId > parseInt(this.dataset.maximum)){
		nextPortalId = 1
	} 
	requestPortal(nextPortalId)
}

function requestPortal(nextUp){
	$('#accordian')[0].style.display = 'none'
	$('#viewQuests')[0].style.display = 'block'
	$.getJSON(`/portals/${nextUp}`, function(data){	
		const portal = new Portal(data)
		portal.viewPortal()
	})
}