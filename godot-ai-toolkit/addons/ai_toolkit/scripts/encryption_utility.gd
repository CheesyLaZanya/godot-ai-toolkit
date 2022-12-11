@tool
extends Node

var crypto = Crypto.new()
var toolkit_path = "res://addons/ai_toolkit"
var secrets_folder_path = "/secrets/"
var key_path = toolkit_path + secrets_folder_path + "/generated.key"

func get_encryption_key():
	var key = CryptoKey.new()
	if not FileAccess.file_exists(key_path):
		var dir = DirAccess.open(toolkit_path)
		if not dir.dir_exists(secrets_folder_path):
			dir.make_dir(secrets_folder_path)
		
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


func decrypt_api_key(encrypted_key):
	var key = get_encryption_key()
	var key_array = encrypted_key.replace("[", "").replace("]", "").split(",")
	var api_key = decrypt_data(key, PackedByteArray(Array(key_array)))
	# print("Api key: %s " % api_key)
	return api_key
