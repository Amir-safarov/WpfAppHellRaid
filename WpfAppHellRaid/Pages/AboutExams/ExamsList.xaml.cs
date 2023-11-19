using System;
using System.Collections.Generic;
using System.ComponentModel;
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

namespace WpfAppHellRaid.Pages
{
    /// <summary>
    /// Логика взаимодействия для ExamsList.xaml
    /// </summary>
    public partial class ExamsList : Page
    {
        public ExamsList()
        {
            InitializeComponent();
            if(App.isEmployee == false)
            {
                DelExam.Visibility = Visibility.Collapsed;
                AddExam.Visibility = Visibility.Collapsed;
            }
            ListRefresh();
            ExamsListView.ItemsSource = App.DataBase.Exasm.Where(x => x.ExamEnable == true).ToList();
            DateSortCB.SelectedIndex = 0;
            NameSortCB.SelectedIndex = 0;
        }

        private void DateSortCB_SelectionChanged(object sender, SelectionChangedEventArgs e)
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
        private void ListRefresh()
        {
            var database = App.DataBase.Exasm.Where(x => x.ExamEnable == true);
            ICollectionView view = CollectionViewSource.GetDefaultView(database.ToList());

            if (DateSortCB.SelectedIndex == 0)
            {
                ExamsListView.ItemsSource = database.OrderBy(x => x.Date_ex).ToList();
            }
            if (DateSortCB.SelectedIndex == 1)
            {
                ExamsListView.ItemsSource = database.OrderByDescending(x => x.Date_ex).ToList();
            }
            if (NameSortCB.SelectedIndex == 0)
            {
                ExamsListView.ItemsSource = database.OrderBy(x => x.Student.FIO).ToList();
            }
            if (NameSortCB.SelectedIndex == 1)
            {
                ExamsListView.ItemsSource = database.OrderByDescending(x => x.Student.FIO).ToList();
            }
            if (SearchTB.Text != "" & SearchTB.Text != null)
            {
                ExamsListView.ItemsSource = database.Where(x => x.Student.FIO.ToLower().Contains(SearchTB.Text.ToLower())).ToList();
            }

            view.Refresh();
        }

        private void AddExam_Click(object sender, RoutedEventArgs e)
        {
            if (ExamsListView.SelectedItem != null)
                ModernNavigation.NextPage(new PageComponent("Редактировать запись экзамена", new ExamAdd((ExamsListView.SelectedItem as Exasm))));
            else
            {
                ModernNavigation.NextPage(new PageComponent("Добавление запись экзамена", new ExamAdd(new Exasm())));
                MessageBox.Show("Открыто окно добавления записи.\n Что бы изменить запись вернитесь и выберите запись из списка.");
            }
        }

        private void DelExam_Click(object sender, RoutedEventArgs e)
        {
            if (ExamsListView.SelectedItem != null)
            {
                (ExamsListView.SelectedItem as Exasm).ExamEnable = false;
                MessageBox.Show($"Запись {(ExamsListView.SelectedItem as Exasm).ID} была удалена");
                App.DataBase.SaveChanges();
            }
            else
                MessageBox.Show("Выберите запись");

        }

        private void RefreshList_Click(object sender, RoutedEventArgs e)
        {
            ExamsListView.ItemsSource = App.DataBase.Exasm.Where(x => x.ExamEnable == true).ToList();
            DateSortCB.SelectedIndex = 0;
            NameSortCB.SelectedIndex = 0;

        }
    }
}
