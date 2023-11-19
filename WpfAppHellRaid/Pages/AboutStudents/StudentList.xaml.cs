using System;
using System.Collections.Generic;
using System.Data.Entity;
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
            if (App.isEmployee == false)
                AddStud.Visibility = Visibility.Collapsed;
                ListRefresh();
            SpecSortCB.SelectedIndex = 0;
            NameSortCB.SelectedIndex = 0;
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
            ModernNavigation.NextPage(new PageComponent("Добавить новую запись экзамена", new StudentEdit(new Student())));
        }
        private void ListRefresh()
        {
            IEnumerable<Student> servicesSortList = App.DataBase.Student.Where(x => x.StudEnable == true);

            if (SpecSortCB.SelectedIndex == 0)
            {
                servicesSortList = servicesSortList.OrderBy(x => x.Speciality.Name_spec);
            }
            if (SpecSortCB.SelectedIndex == 1)
            {
                servicesSortList = servicesSortList.OrderByDescending(x => x.Speciality.Name_spec);
            }
            if (NameSortCB.SelectedIndex == 0)
            {
                servicesSortList = servicesSortList.OrderBy(x => x.FIO);
            }
            if (NameSortCB.SelectedIndex == 1)
            {
                servicesSortList = servicesSortList.OrderByDescending(x => x.FIO);
            }
            if (SearchTB.Text != "" & SearchTB.Text != null)
            {
                servicesSortList = servicesSortList.Where(x => x.FIO.ToLower().Contains(SearchTB.Text.ToLower()) || x.Speciality.Name_spec.ToLower().Contains(SearchTB.Text.ToLower())).ToList();

            }
            ServiceWrap.Children.Clear();

            foreach (var item in servicesSortList)
            {
                ServiceWrap.Children.Add(new StudentUserControl(item));
            }
        }

        private void RefreshStud_Click(object sender, RoutedEventArgs e)
        {
            ListRefresh();
        }
    }
}
