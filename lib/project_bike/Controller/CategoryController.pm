package project_bike::Controller::CategoryController;
use Mojo::Base 'Mojolicious::Controller' , -signatures;
use project_bike::Model::MCategory;

has _MCategory => sub($self) {
  return project_bike::Model::MCategory->new ({ schema => $self->schema });
};

sub get_categories($self) {
  my $data = $self->_MCategory->get_list_category;
  return $self->render(
    template    => 'pages/home',
    brands  => $data
  );
}

1;
