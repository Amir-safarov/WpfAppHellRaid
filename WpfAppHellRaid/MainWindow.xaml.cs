using System;
using System.Collections.Generic;
using System.Drawing;
using System.IO;
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
using WpfAppHellRaid.Components;
using WpfAppHellRaid.Pages;
using WpfAppHellRaid.Pages.AboutStudents;

namespace WpfAppHellRaid
{
    /// <summary>
    /// Логика взаимодействия для MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        public MainWindow()
        {
            InitializeComponent();
            MessageBox.Show("Примеры пользователей:\nСтудент: 10101\nПреподаватель: 101\nАдмин:admin");
            ModernNavigation.mainWindow = this;
            ModernNavigation.NextPage(new PageComponent("Авторизация",new Authorization()));
        }

        private void BackBTN_Click(object sender, RoutedEventArgs e)
        {
            ModernNavigation.BackPage();
        }

        private void MenuBTN_Click(object sender, RoutedEventArgs e)
        {
            ModernNavigation.BackAuth();
            MessageBox.Show("Вы вышли из вашей учетной записи.");
        }

        private void QRBTN_Click(object sender, RoutedEventArgs e)
        {
            ModernNavigation.NextPage(new PageComponent("О нас", new QR()));
        }
    }
}
