using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;

namespace PaperApp.Pages
{
    /// <summary>
    /// Логика взаимодействия для MainPage.xaml
    /// </summary>
    public partial class MainPage : Page
    {
        public MainPage()
        {
            InitializeComponent();

            DocumentsDataGrid.ItemsSource = Data.PaperDBEntities.GetContext().Document.ToList();

            var type = Data.PaperDBEntities.GetContext().DocumentType.ToList();
            type.Insert(0, new Data.DocumentType { TypeName = "Все типы" });

            var status = Data.PaperDBEntities.GetContext().DocumentStatus.ToList();
            status.Insert(0, new Data.DocumentStatus { StatusName = "Все статусы" });

            TypeComboBox.ItemsSource = type;
            StatusComboBox.ItemsSource = status;
            TypeComboBox.SelectedIndex = 0;
            StatusComboBox.SelectedIndex = 0;
        }

        private void EditButton_Click(object sender, RoutedEventArgs e)
        {
            Classes.Manager.MainFrame.Navigate(new Pages.AddEditDocumentPage((sender as Button).DataContext as Data.Document));
        }

        private void AddButton_Click(object sender, RoutedEventArgs e)
        {
            Classes.Manager.MainFrame.Navigate(new Pages.AddEditDocumentPage(null));
        }

        private void BackButton_Click(object sender, RoutedEventArgs e)
        {
            if (Classes.Manager.MainFrame.CanGoBack)
            {
                Classes.Manager.MainFrame.GoBack();
            }
        }

        List<Data.Document> docs = Data.PaperDBEntities.GetContext().Document.ToList();
        public void Update()
        {
            try
            {
                docs = Data.PaperDBEntities.GetContext().Document.ToList();

                var selectedType = TypeComboBox.SelectedItem as Data.DocumentType;
                var selectedStatus = StatusComboBox.SelectedItem as Data.DocumentStatus;

                if (selectedType != null && selectedType.TypeName != "Все типы")
                {
                    docs = docs.Where(d => d.IdDocumentType == selectedType.Id).ToList();
                }

                if (selectedStatus != null && selectedStatus.StatusName != "Все статусы")
                {
                    docs = docs.Where(d => d.IdStatus == selectedStatus.Id).ToList();
                }

                DocumentsDataGrid.ItemsSource = docs;
            }
            catch (Exception)
            {

            }
        }

        private void TypeComboBox_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            Update();
        }

        private void StatusComboBox_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            Update();
        }

        private void Page_IsVisibleChanged(object sender, DependencyPropertyChangedEventArgs e)
        {
            Update();
        }
    }
}
