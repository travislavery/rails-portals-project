function handleQuestForm(event){
	event.preventDefault()
  const values = $(this).serialize()
  const posting = $.post('/quests', values)
  posting.done(function(data){
    const newQuest = new Quest(data)
    newQuest.addSingleToPage('#createdQuest')
  }).fail(function(data){
  	const errors = data['responseJSON']['errors']
  	$('.alert')[0].innerText = errors.join(', ')
  })
}