﻿#pragma checksum "..\..\..\Pages\Crash.xaml" "{8829d00f-11b8-4213-878b-770e8597ac16}" "294B6FC7002014A34CF79C9CD319B224FE0A426C5E49FB6947C6B17B85F599D0"
//------------------------------------------------------------------------------
// <auto-generated>
//     Этот код создан программой.
//     Исполняемая версия:4.0.30319.42000
//
//     Изменения в этом файле могут привести к неправильной работе и будут потеряны в случае
//     повторной генерации кода.
// </auto-generated>
//------------------------------------------------------------------------------

using System;
using System.Diagnostics;
using System.Windows;
using System.Windows.Automation;
using System.Windows.Controls;
using System.Windows.Controls.Primitives;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Ink;
using System.Windows.Input;
using System.Windows.Markup;
using System.Windows.Media;
using System.Windows.Media.Animation;
using System.Windows.Media.Effects;
using System.Windows.Media.Imaging;
using System.Windows.Media.Media3D;
using System.Windows.Media.TextFormatting;
using System.Windows.Navigation;
using System.Windows.Shapes;
using System.Windows.Shell;
using WpfApp1.Pages;


namespace WpfApp1.Pages {
    
    
    /// <summary>
    /// Crash
    /// </summary>
    public partial class Crash : System.Windows.Controls.Page, System.Windows.Markup.IComponentConnector {
        
        
        #line 24 "..\..\..\Pages\Crash.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.TextBox BetAmountTextBox;
        
        #line default
        #line hidden
        
        
        #line 30 "..\..\..\Pages\Crash.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.TextBlock BetAmountTextBlock;
        
        #line default
        #line hidden
        
        
        #line 33 "..\..\..\Pages\Crash.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.TextBlock PlayerCardsTextBlock;
        
        #line default
        #line hidden
        
        
        #line 36 "..\..\..\Pages\Crash.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.TextBlock PlayerScoreTextBlock;
        
        #line default
        #line hidden
        
        
        #line 39 "..\..\..\Pages\Crash.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.TextBlock DealerCardsTextBlock;
        
        #line default
        #line hidden
        
        
        #line 40 "..\..\..\Pages\Crash.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.TextBlock DealerScoreTextBlock;
        
        #line default
        #line hidden
        
        
        #line 44 "..\..\..\Pages\Crash.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.Button HitButton;
        
        #line default
        #line hidden
        
        
        #line 45 "..\..\..\Pages\Crash.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.Button StandButton;
        
        #line default
        #line hidden
        
        
        #line 49 "..\..\..\Pages\Crash.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.TextBlock ResultTextBlock;
        
        #line default
        #line hidden
        
        private bool _contentLoaded;
        
        /// <summary>
        /// InitializeComponent
        /// </summary>
        [System.Diagnostics.DebuggerNonUserCodeAttribute()]
        [System.CodeDom.Compiler.GeneratedCodeAttribute("PresentationBuildTasks", "4.0.0.0")]
        public void InitializeComponent() {
            if (_contentLoaded) {
                return;
            }
            _contentLoaded = true;
            System.Uri resourceLocater = new System.Uri("/WpfApp1;component/pages/crash.xaml", System.UriKind.Relative);
            
            #line 1 "..\..\..\Pages\Crash.xaml"
            System.Windows.Application.LoadComponent(this, resourceLocater);
            
            #line default
            #line hidden
        }
        
        [System.Diagnostics.DebuggerNonUserCodeAttribute()]
        [System.CodeDom.Compiler.GeneratedCodeAttribute("PresentationBuildTasks", "4.0.0.0")]
        [System.ComponentModel.EditorBrowsableAttribute(System.ComponentModel.EditorBrowsableState.Never)]
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Design", "CA1033:InterfaceMethodsShouldBeCallableByChildTypes")]
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Maintainability", "CA1502:AvoidExcessiveComplexity")]
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1800:DoNotCastUnnecessarily")]
        void System.Windows.Markup.IComponentConnector.Connect(int connectionId, object target) {
            switch (connectionId)
            {
            case 1:
            this.BetAmountTextBox = ((System.Windows.Controls.TextBox)(target));
            return;
            case 2:
            
            #line 27 "..\..\..\Pages\Crash.xaml"
            ((System.Windows.Controls.Button)(target)).Click += new System.Windows.RoutedEventHandler(this.ConfirmBet_Click);
            
            #line default
            #line hidden
            return;
            case 3:
            this.BetAmountTextBlock = ((System.Windows.Controls.TextBlock)(target));
            return;
            case 4:
            this.PlayerCardsTextBlock = ((System.Windows.Controls.TextBlock)(target));
            return;
            case 5:
            this.PlayerScoreTextBlock = ((System.Windows.Controls.TextBlock)(target));
            return;
            case 6:
            this.DealerCardsTextBlock = ((System.Windows.Controls.TextBlock)(target));
            return;
            case 7:
            this.DealerScoreTextBlock = ((System.Windows.Controls.TextBlock)(target));
            return;
            case 8:
            this.HitButton = ((System.Windows.Controls.Button)(target));
            
            #line 44 "..\..\..\Pages\Crash.xaml"
            this.HitButton.Click += new System.Windows.RoutedEventHandler(this.HitButton_Click);
            
            #line default
            #line hidden
            return;
            case 9:
            this.StandButton = ((System.Windows.Controls.Button)(target));
            
            #line 45 "..\..\..\Pages\Crash.xaml"
            this.StandButton.Click += new System.Windows.RoutedEventHandler(this.StandButton_Click);
            
            #line default
            #line hidden
            return;
            case 10:
            this.ResultTextBlock = ((System.Windows.Controls.TextBlock)(target));
            return;
            case 11:
            
            #line 50 "..\..\..\Pages\Crash.xaml"
            ((System.Windows.Controls.Button)(target)).Click += new System.Windows.RoutedEventHandler(this.BackButton_Click);
            
            #line default
            #line hidden
            return;
            }
            this._contentLoaded = true;
        }
    }
}

