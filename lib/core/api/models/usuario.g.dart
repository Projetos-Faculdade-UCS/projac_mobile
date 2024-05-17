// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'usuario.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Usuario _$UsuarioFromJson(Map<String, dynamic> json) => Usuario(
      id: (json['id'] as num).toInt(),
      nome: json['nome'] as String,
      sobrenome: json['sobrenome'] as String,
      email: json['email'] as String,
      genero: json['genero'] as String,
      telefone: json['telefone'] as String,
      dataNascimento: json['dataNascimento'] as String,
      fotoPerfil: json['fotoPerfil'] == null
          ? null
          : Uri.parse(json['fotoPerfil'] as String),
    );

Map<String, dynamic> _$UsuarioToJson(Usuario instance) => <String, dynamic>{
      'id': instance.id,
      'nome': instance.nome,
      'sobrenome': instance.sobrenome,
      'email': instance.email,
      'genero': instance.genero,
      'telefone': instance.telefone,
      'dataNascimento': instance.dataNascimento,
      'fotoPerfil': instance.fotoPerfil?.toString(),
    };
