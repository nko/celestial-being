= About plugin features =


- TweetIRC.features.CommandListener

 calls onCommand(commandTokens) on the plugin.
 commandTokens[0] is the command, commandTokens[1] is the rest of the line

- TweetIRC.features.GlobalMessageListener

  calls onGlobalMessage on the plugin when messages are published to 'messages/global'
  
- TweetIRC.features.MessageListener

  calls onMessage on the plugin when messages are published to 'messages'  
  
  
  
  
  
  