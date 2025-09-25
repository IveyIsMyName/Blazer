using Microsoft.AspNetCore.Components.Web;
using Microsoft.CodeAnalysis;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Runtime.CompilerServices;

namespace BlazorAcademy.Models
{
	public class Human
	{
		[Required]
		[Display(Name="Фамилия")]
		public string last_name { get; set; }
		[Required]
		public string first_name { get; set; }
		public string? middle_name { get; set; }
		[Required]
		public DateOnly birth_date { get; set; }
		[EmailAddress]
		public string? email { get; set; }
		[Phone]
		public string? phone { get; set; }
		public byte[]? photo { get; set; }
	}
}
