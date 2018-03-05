$(function(){
	$('.questForm').on('submit', handleQuestForm)
})

function handleQuestForm(event){
	event.preventDefault()
  let values = $(this).serialize()
  let posting = $.post('/quests', values)
  posting.done(function(data){
    const newQuest = new Quest(data)
    newQuest.addSingleToPage('#createdQuest')
  }).fail(function(data){
  	let errors = data['responseJSON']['errors']
  	$('.alert')[0].innerText = errors.join(', ')
  })
}