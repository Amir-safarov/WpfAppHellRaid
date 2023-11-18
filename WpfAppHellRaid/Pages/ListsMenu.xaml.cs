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
using WpfAppHellRaid.Components;
using WpfAppHellRaid.Pages.AboutEmployee;
using WpfAppHellRaid.Pages.AboutStudents;

namespace WpfAppHellRaid.Pages
{
    /// <summary>
    /// Логика взаимодействия для ListsMenu.xaml
    /// </summary>
    public partial class ListsMenu : Page
    {
        public ListsMenu()
        {
            InitializeComponent();
        }
        private void StudentBTN_Click(object sender, RoutedEventArgs e)
        {
            ModernNavigation.NextPage(new PageComponent("Список студентов", new StudentList()));
        }

        private void ExamBTN_Click(object sender, RoutedEventArgs e)
        {
            ModernNavigation.NextPage(new PageComponent("Список экзаменов", new ExamsList()));
        }

        private void EmployeeBTN_Click(object sender, RoutedEventArgs e)
        {
            ModernNavigation.NextPage(new PageComponent("Список преподавателей", new EmployeeList()));
        }

        private void DisciplinesBTN_Click(object sender, RoutedEventArgs e)
        {

        }
        }
    }

