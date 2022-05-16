# include <gtk/gtk.h> 

GtkWidget *label;                                              // Метка 
GtkWidget *input_1;                                           // Ввод 1
GtkWidget *input_2;                                          // Ввод 2
GtkWidget *button;                                          // Ввод 2
GtkWidget *window;                                         // Главное окно 
GtkWidget *grid;

static void
print_hello (GtkWidget *widget,
             gpointer   data)
{
   gtk_
}

int main( int argc, char *argv[] ) 
{ 

   

   gtk_init( &argc, &argv );                           // Инициализируем GTK+
   window = gtk_window_new( GTK_WINDOW_TOPLEVEL );            // Создаем главное окно
   input_1 = gtk_entry_new();      // Создаем метку с текстом
   input_2 = gtk_entry_new();      // Создаем метку с текстом
   label = gtk_label_new("result");      // Создаем метку с текстом
   button = gtk_button_new();      // Создаем метку с текстом
   gtk_button_set_label(button, "Calculate");
   gtk_button_

   grid = gtk_grid_new();
   gtk_container_add (GTK_CONTAINER (window), grid);
   gtk_grid_attach(GTK_GRID(grid), input_1, 0, 0, 1, 1);
   gtk_grid_attach(GTK_GRID(grid), input_2, 0, 1, 1, 1);
   gtk_grid_attach(GTK_GRID(grid), button, 0, 2, 1, 1);
   gtk_grid_attach(GTK_GRID(grid), label, 0, 3, 1, 1);

   gtk_widget_show_all( window );                             // Показываем окно вместе с виджетами
   g_signal_connect( G_OBJECT( window ), "destroy", // Соединяем сигнал завершения с выходом
                     G_CALLBACK( gtk_main_quit ), NULL ); 
   g_signal_connect(button, "clicked", G_CALLBACK (print_hello), NULL);
   gtk_main();                                                // Приложение переходит в цикл ожидания 
   return 0; 
}
