gen:
	flutter pub run build_runner build --delete-conflicting-outputs lib .
format:
	flutter format .

fmt: format

run:
	flutter run