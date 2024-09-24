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
    /// Логика взаимодействия для HistoryStatusesPage.xaml
    /// </summary>
    public partial class HistoryStatusesPage : Page
    {
        public HistoryStatusesPage()
        {
            InitializeComponent();

            HistoryDataGrid.ItemsSource = Data.PaperDBEntities.GetContext().ChangeHistory.ToList();
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
