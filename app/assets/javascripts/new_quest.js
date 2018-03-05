$(function(){
	$('form').on('submit', handleQuestForm)
})

function handleQuestForm(event){
	event.preventDefault()
	//debugger
  let values = $(this).serialize()
  let posting = $.post('/quests', values)
  posting.done(function(data){
    const newQuest = new Quest(data)
    newQuest.addSingleToPage('#createdQuest')
  }).fail(function(data){
  	$('.alert')[0].innerText = ""
  	let errors = data['responseJSON']['errors']
  	errors.forEach(function(error){
  		$('.alert')[0].innerText += error
  	})
  	
  })
}