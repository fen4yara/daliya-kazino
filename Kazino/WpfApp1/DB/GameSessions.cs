//------------------------------------------------------------------------------
// <auto-generated>
//     Этот код создан по шаблону.
//
//     Изменения, вносимые в этот файл вручную, могут привести к непредвиденной работе приложения.
//     Изменения, вносимые в этот файл вручную, будут перезаписаны при повторном создании кода.
// </auto-generated>
//------------------------------------------------------------------------------

namespace WpfApp1.DB
{
    using System;
    using System.Collections.Generic;
    
    public partial class GameSessions
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public GameSessions()
        {
            this.Bets = new HashSet<Bets>();
        }
    
        public int SessionID { get; set; }
        public int UserID { get; set; }
        public int GameID { get; set; }
        public System.DateTime Date { get; set; }
        public Nullable<decimal> BetAmount { get; set; }
        public Nullable<decimal> WinAmount { get; set; }
    
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Bets> Bets { get; set; }
        public virtual Game Game { get; set; }
        public virtual User User { get; set; }
    }
}