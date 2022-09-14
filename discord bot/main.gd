extends Control
var rand_generate = RandomNumberGenerator.new()
var truths= ["What's the last lie you told?","Who are you crushing on right now?",
 " What was the most embarrassing thing you've ever done in class?",
  "Name someone you actually can't stand in class",
  "What's your most bizarre nickname?",
 " What's been your most physically painful experience?",
  "What's the craziest thing you've done in the bus?",
  "If you met a genie, what would your three wishes be?",
  "What's the craziest thing you've done in front of a mirror?",
  "What's the meanest thing you've ever said about someone else?",
 " Who are you most jealous of?",
  "Have you ever faked sick to get out of a party?",
  "How many selfies do you take a day?",
  "How many times a week do you wear the same pants?",
  "Would you date your school crush?",
  "When's the last time you apologized?" ,
  "Have you ever peed in a pool?",
  "If you were guaranteed to never get caught, who in the class would you murder?",
 " What app do you waste the most time on?",
 " What's the weirdest thing you've done on a plane?",
  "How many gossip blogs do you read a day?",
  "Have you ever lied about your age?",
  "If you had to delete one app from your phone, which one would it be?",
  "What's the longest you've gone without showering?",
 " Which of your family members annoys you the most and why?",
  "What's the most embarrassing text in your phone right now?",
  "Have you ever seen a dead body?",
 " What celebrity do you think is overrated?",
  "Have you ever lied to you’re the teacher?",
  "Have you ever stolen something from classroom?",
  "What's the longest you've gone without brushing your teeth?",
 " What's your biggest regret in this year?",
 " Have you ever had a crush on another student?",
  "What are your favorite and least favorite of your body parts?",
 " What's the most childish thing you still do in 8th std?",
  "If you had to pick someone in this  server to be your partner on a game show, who would it be and why?",
  "Have you ever lied for a friend?",
  "Name one thing you'd change about every person in this server" ,
  "When's the last time you made someone else cry?",
  "What's one thing in your life you wish you could change?",
  "What was the greatest day of your life?",
  "What's one useless skill you'd love to learn anyway?",
  "Have you ever farted and blamed it on someone else?",
 " What's the worst thing you've ever done in school?",
  "What's your number?",
  "What's the weirdest dream you've ever had?",
  "What do you want on your tombstone?",
  "What's the last movie that made you cry?",
  "What's the most sinful thing you've done in school?",
  "Who would you call to help bury a body?",
  "What was your biggest fear as a child?",
  "What's the last thing you Googled?",
 " If you could only hear one song for the rest of your life, what would it be?",
  "What's the last YouTube video you watched?",
  "What's the hardest drug you've ever tried?",
  "When's the last time you peed your pants?",
  "Who in 8th sigma would be your one phone call if you were in jail?",
  "If you could hire someone to do one thing for you, what would it be?",
 " What's the best lie you've ever told anyone?",
  "When's the last time you got caught in a lie?",
  "Have you ever been in a fight in class?",
  "What's the worst advice you've ever given someone else?",
  "When's the last time you wanted to hit somebody?",
  "Have you ever intentionally sabotaged a classmate?" ,
 " What's the weirdest thing you've ever said to someone in class?",
  "Who in this class do you trust the least?",
  "What's the most inappropriate time you've ever laughed?",
  "What's the dumbest thing you've ever lied about?",
  "What's the weirdest thought you've had sitting on a toilet?",
  "What's the biggest secret you've kept from your parents?",
  "What's the most offensive joke you've found funny?",
  "What are you most proud of in your life?",]



# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var prefix = "j!"
 
#var count = numbers[0]
onready var discordbot = $DiscordBot
# Called when the node enters the scene tree for the first time.
func _ready():
	var discordbot = $DiscordBot
	 
	discordbot.TOKEN = "OTU4MzY2NDQ3ODk2MjMxOTY2.GRrl58._8Q7aTCC-GhyaayccJBpd0iDDUuNrtjeTllpfA"
	discordbot.login()
	
	discordbot.connect("bot_ready",self,"on_bot_ready")
	discordbot.connect("message_create",self,"on_message_create")
	

func on_bot_ready(bot: DiscordBot):
	print("IT IS ALIVE!")
	
	discordbot.set_presence({
		'activity' : {
			'type' : "GAME"
	,		'name' : "with your mom"
		}
	})


func on_message_create(bot: DiscordBot, message: Message, channel: Dictionary):
	if message.content:
		print('got a message:',message.content,'in ',message.channel_id)
	if message.author.bot:
		return
	if message.content.begins_with(prefix):
		print(message.content,' in ',message.channel_id)
		
	var command_content = message.content.lstrip(prefix)
	
	var tokens = []
	var regex = RegEx.new()
	regex.compile("\\S+")
	
	for token in regex.search_all(command_content):
		tokens.append(token.get_string() )
		
	var cmd = tokens[0].to_lower()
	tokens.remove(0)
	var args = tokens
	
	commands(bot,message,channel,cmd,args)
		
func commands(bot,message,channel,cmd,args):
	match cmd:
		"hi":
			bot.send(message,"Hi!")
			
	
			
	match cmd:
		'kill':
			
			var victom = message.mentions[0].id
			var messages = ["<@%s>"%victom+ 'was hit with a baguette by you',"<@%s>"%victom+ 'was drowned in the stew',"<@%s>"%victom+"was baked alive",
			"<@%s>"%victom +'was cooked alive', "<@%s>"%victom+ 'was electrocuted by you', "<@%s>"%victom + 'was zapped by you',"<@%s>"%victom+ 'was blasted with toxicity from you',
			 "<@%s>"%victom+ 'was struck with lightning',  "<@%s>"%victom+ ' was arrested by the police',"<@%s>"%victom+ ' got hit with a baton','you had no choice but to kill'+ "<@%s>"%victom + ' with your pistol',
			"<@%s>"%victom+ 'was sniped by a hitman', "<@%s>"%victom+ 'got pickpocketed', "<@%s>"%victom+ 'was hit by a dynamite explosion placed by you', "<@%s>"%victom+ 'was hit by a paper airplane folded by you',"<@%s>"%victom+ 'stepped on a lego',"<@%s>"%victom +  'broke his hand breaking his keyboard while losing to a noob',"<@%s>"%victom+'got ratioed by you',"<@%s>"%victom+'lost an online arguement while still typing',"<@%s>"%victom+'was stapled to the floor',"<@%s>"%victom+'was a victom of your attempt of magic',"<@%s>"%victom+'was nuked',"<@%s>"%victom+'cought covid from you',"<@%s>"%victom+'was blocked by you',"<@%s>"%victom+'got caught in 4k']
			rand_generate.randomize()
			var rand_int = rand_generate.randi_range(0,messages.size()-1)
			

			bot.send(message,messages[rand_int])
	match cmd:
		'truth':	
			rand_generate.randomize()
			var rand_int = rand_generate.randi_range(0,truths.size()-1)
			bot.send(message,truths[rand_int])
			
	if "yajat" in message.content:
		bot.reply(message,"jajat*")
			
	match cmd:
		"ping":
			var start_time = OS.get_ticks_msec()
			var pingmessage = yield(bot.reply(message,"ping loading..."),"completed")
			
			var pingtimevariable = str(OS.get_ticks_msec())
			
			bot.edit(pingmessage,"My latency is,"+pingtimevariable+" ms...")
			 
	#match cmd:
	#	"yajat":
	#		bot.reply(message,"jajat*")
			
			
	match cmd:
		"reaction":
			yield(bot.create_reaction(message, "958734582486818916"), "completed")
	
	match cmd:
		"avatar":
			var avatar_url = message.author.get_display_avatar_url()
			var embed = Embed.new().set_image(avatar_url)
			bot.send(message, {"embeds": [embed]})
	#match cmd:
	#	"Who":
	#		var who = message.author.username
	#		bot.send(message,"you are "+who)
			
	#match cmd:
	#	"count":
	#		var current_no= numbers[0]
	#		if "%s"%current_no in message:
	#			
	#			current_no=current_no+1
	#			bot.send(message,'accepted')
