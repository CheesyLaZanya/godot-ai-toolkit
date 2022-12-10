extends Node

var crypto = Crypto.new()
var key_path = "user://generated.key"

func get_encryption_key():
	var key = CryptoKey.new()
	if not FileAccess.file_exists(key_path):
		# Generate new RSA key.
		key = crypto.generate_rsa(4096)
	
		# Save key and certificate in the user folder.
		key.save(key_path)
	else:
		var error = key.load(key_path)
		if error != OK:
			printerr("Failed to read key!")

	return key


func encrypt_data(key, data):
	var encrypted_data = crypto.encrypt(key, data.to_utf8_buffer())
	return encrypted_data


func decrypt_data(key, encrypted_data):
	var decrypted_data = crypto.decrypt(key, encrypted_data).get_string_from_utf8()
	return decrypted_data