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
    /// Логика взаимодействия для AddEditDocumentPage.xaml
    /// </summary>
    public partial class AddEditDocumentPage : Page
    {
        public Data.Document _currentDocument = new Data.Document();
        public string flag = "default";
        public AddEditDocumentPage(Data.Document _selectedDoc)
        {
            InitializeComponent();

            if (_selectedDoc != null)
            {
                _currentDocument = _selectedDoc;
                flag = "edit";
            }
            else
            {
                flag = "add";
            }

            DataContext = _currentDocument;

            Init();
        }

        public void Init()
        {
            try
            {
                TypeComboBox.ItemsSource = Data.PaperDBEntities.GetContext().DocumentType.ToList();
                FullNameComboBox.ItemsSource = Data.PaperDBEntities.GetContext().Employee.ToList();
                DepartmentComboBox.ItemsSource = Data.PaperDBEntities.GetContext().Department.ToList();
                StatusComboBox.ItemsSource = Data.PaperDBEntities.GetContext().DocumentStatus.ToList();
                if (flag == "add")
                {
                    TitleTextBox.Text = string.Empty;
                    TypeComboBox.SelectedItem = null;
                    FullNameComboBox.SelectedItem = null;
                    DepartmentComboBox.SelectedItem = null;
                    StatusComboBox.SelectedItem = null;
                }
                else if (flag == "edit")
                {
                    TitleTextBox.Text = _currentDocument.Title;
                    FullNameComboBox.SelectedItem = _currentDocument.Employee;
                    DepartmentComboBox.SelectedItem = _currentDocument.Department;
                    TypeComboBox.SelectedItem = _currentDocument.DocumentType;
                    StatusComboBox.SelectedItem = _currentDocument.DocumentStatus;
                }
            }
            catch (Exception)
            {

            }
        }

        private void SaveButton_Click(object sender, RoutedEventArgs e)
        {
            try
            {
                StringBuilder errors = new StringBuilder();
                if (string.IsNullOrEmpty(TitleTextBox.Text))
                {
                    errors.AppendLine("Заполните наименование");
                }
                if (TypeComboBox.SelectedItem == null)
                {
                    errors.AppendLine("Выберите тип");
                }
                if (FullNameComboBox.SelectedItem == null)
                {
                    errors.AppendLine("Выберите сотрудника");
                }
                if (DepartmentComboBox.SelectedItem == null)
                {
                    errors.AppendLine("Выберите отдел");
                }
                if (StatusComboBox.SelectedItem == null)
                {
                    errors.AppendLine("Выберите статус");
                }

                if (errors.Length > 0)
                {
                    MessageBox.Show(errors.ToString(), "Ошибка!", MessageBoxButton.OK, MessageBoxImage.Error);
                    return;
                }

                _currentDocument.Title = TitleTextBox.Text;
                _currentDocument.DocumentType = TypeComboBox.SelectedItem as Data.DocumentType;
                _currentDocument.Employee = FullNameComboBox.SelectedItem as Data.Employee;
                _currentDocument.Department = DepartmentComboBox.SelectedItem as Data.Department;
                _currentDocument.DocumentStatus = StatusComboBox.SelectedItem as Data.DocumentStatus;

                if (flag == "add")
                {
                    Data.PaperDBEntities.GetContext().Document.Add(_currentDocument);
                    Data.PaperDBEntities.GetContext().SaveChanges();
                    MessageBox.Show("Успешно сохранено!", "Успех!", MessageBoxButton.OK, MessageBoxImage.Information);
                    UpdateHistory();
                }
                else if (flag == "edit")
                {
                    Data.PaperDBEntities.GetContext().SaveChanges();
                    MessageBox.Show("Успешно сохранено!", "Успех!", MessageBoxButton.OK, MessageBoxImage.Information);
                    UpdateHistory();
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.ToString(), "Ошибка!", MessageBoxButton.OK, MessageBoxImage.Error);
            }
        }

        public void UpdateHistory()
        {
            try
            {
                var status = StatusComboBox.SelectedItem as Data.DocumentStatus;
                DateTime now = DateTime.Now;
                string statusText = string.Empty;
                switch (status.StatusName)
                {
                    case "Черновик":
                        statusText = "Изменение статуса на \"Черновик\"";
                        break;
                    case "В процессе":
                        statusText = "Изменение статуса на \"В процессе\"";
                        break;
                    case "На утверждении":
                        statusText = "Изменение статуса на \"На утверждении\"";
                        break;
                    case "Утвержден":
                        statusText = "Изменение статуса на \"Утвержден\"";
                        break;
                    case "Отклонен":
                        statusText = "Изменение статуса на \"Отклонен\"";
                        break;
                }

                Data.ChangeHistory changeHistory = new Data.ChangeHistory()
                {
                    IdDocument = _currentDocument.Id,
                    ChangeDate = now,
                    ChangeDescription = statusText
                };

                Data.PaperDBEntities.GetContext().ChangeHistory.Add(changeHistory);
                Data.PaperDBEntities.GetContext().SaveChanges();
            }
            catch (Exception)
            {

            }
        }

        private void BackButton_Click(object sender, RoutedEventArgs e)
        {
            if (Classes.Manager.MainFrame.CanGoBack)
            {
                Classes.Manager.MainFrame.GoBack();
            }
        }
    }
}
