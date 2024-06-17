part of 'producao_academica_bloc.dart';

sealed class ProducaoAcademicaState extends Equatable {
  const ProducaoAcademicaState();
  
  @override
  List<Object> get props => [];
}

final class ProducaoAcademicaInitial extends ProducaoAcademicaState {}
