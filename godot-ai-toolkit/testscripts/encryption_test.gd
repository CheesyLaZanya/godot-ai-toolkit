extends Node

var crypto = Crypto.new()
var key = CryptoKey.new()

func _ready():
	# Generate new RSA key.
	key = crypto.generate_rsa(4096)
	
	# Save key and certificate in the user folder.
	key.save("user://generated.key")
	
	# Encryption
	var data = "Some data"
	var encrypted = crypto.encrypt(key, data.to_utf8_buffer())
	
	# Decryption
	var decrypted = crypto.decrypt(key, encrypted)
	
	# Checks
	print (encrypted)
	assert(data.to_utf8_buffer() == decrypted)
	print (decrypted.get_string_from_utf8())
