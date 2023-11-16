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
using WpfAppHellRaid.Components.UserControls;

namespace WpfAppHellRaid.Pages.AboutStudents
{
    /// <summary>
    /// Логика взаимодействия для StudentList.xaml
    /// </summary>
    public partial class StudentList : Page
    {
        public StudentList()
        {
            InitializeComponent();
            ListRefresh();
        }
        private void SpecSortCB_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            ListRefresh();
        }

        private void NameSortCB_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            ListRefresh();
        }

        private void SearchTB_TextChanged(object sender, TextChangedEventArgs e)
        {
            ListRefresh();
        }
        private void AddStud_Click(object sender, RoutedEventArgs e)
        {
            ModernNavigation.NextPage(new PageComponent("Добавить новую запись экзамена", new ExamAdd(new Exasm())));
        }
        private void ListRefresh()
        {
            IEnumerable<Student> servicesSortList = App.DataBase.Student;

            if (SpecSortCB.SelectedIndex == 0)
            {
            }
            if (SpecSortCB.SelectedIndex == 1)
            {
            }
            if (NameSortCB.SelectedIndex == 0)
            {
            }
            if (NameSortCB.SelectedIndex == 1)
            {
            }
            if (SearchTB.Text != "" & SearchTB.Text != null)
            {
            }
            ServiceWrap.Children.Clear();
            foreach (var item in servicesSortList)
            {
                ServiceWrap.Children.Add(new StudentUserControl(item));
            }
        }

    }
}
