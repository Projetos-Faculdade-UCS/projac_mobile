part of 'producoes_academicas_bloc.dart';

sealed class ProducoesAcademicasEvent extends Equatable {
  const ProducoesAcademicasEvent();

  @override
  List<Object> get props => [];
}

final class FetchProducoesAcademicas extends ProducoesAcademicasEvent {}
