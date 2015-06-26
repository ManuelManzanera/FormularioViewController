//
//  ViewController.m
//  FormularioViewController
//
//  Created by iOSDev on 22/6/15.
//  Copyright (c) 2015 OhMyApps. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UITextFieldDelegate>

@property (nonatomic, strong) UITextField *nameTextField;
@property (nonatomic, strong) UITextField *passWordTextField;
@property (nonatomic, strong) UITextField *mailTextField;

@end

@implementation ViewController

@synthesize nameTextField, mailTextField, passWordTextField;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    nameTextField = [[UITextField alloc] initWithFrame:CGRectMake(10., 50., 300., 30.)];
    [nameTextField setDelegate:self];
    
    /*
     [nameTextField setBorderStyle:UITextBorderStyleBezel];
     [nameTextField setBorderStyle:UITextBorderStyleLine];
     [nameTextField setBorderStyle:UITextBorderStyleNone];
     */
    [nameTextField setBorderStyle:UITextBorderStyleRoundedRect];
    
    /*
     [nameTextField setReturnKeyType:UIReturnKeyEmergencyCall];
     [nameTextField setReturnKeyType:UIReturnKeyGo];
     .
     .
     [nameTextField setReturnKeyType:UIReturnKeyYahoo];
     */
    
    [nameTextField setReturnKeyType:UIReturnKeyDone];
    
    /*
     [nameTextField setKeyboardAppearance:UIKeyboardAppearanceAlert];
     [nameTextField setKeyboardAppearance:UIKeyboardAppearanceDefault];
     [nameTextField setKeyboardAppearance:UIKeyboardAppearanceLight];
     */
    
    [nameTextField setKeyboardAppearance:UIKeyboardAppearanceDark];
    
    [nameTextField setPlaceholder:@"Nombre de Usuario"];
    
    [self.view addSubview:nameTextField];
    
    mailTextField = [[UITextField alloc] initWithFrame:CGRectMake(nameTextField.frame.origin.x, nameTextField.frame.origin.y + nameTextField.frame.size.height + 10., nameTextField.frame.size.width, nameTextField.frame.size.height)];
    [mailTextField setDelegate:self];
    [mailTextField setPlaceholder:@"Email"];
    [mailTextField setKeyboardType:UIKeyboardTypeEmailAddress];
    [mailTextField setReturnKeyType:UIReturnKeyDone];
    [mailTextField setBorderStyle:UITextBorderStyleLine];
    [mailTextField setClearButtonMode:UITextFieldViewModeAlways];
    
    [self.view addSubview:mailTextField];
    
    passWordTextField = [[UITextField alloc] initWithFrame:CGRectMake(nameTextField.frame.origin.x, mailTextField.frame.origin.y + mailTextField.frame.size.height + 10., nameTextField.frame.size.width, nameTextField.frame.size.height)];
    [passWordTextField setDelegate:self];
    [passWordTextField setPlaceholder:@"Contraseña"];
    [passWordTextField setKeyboardType:UIKeyboardTypeEmailAddress];
    [passWordTextField setReturnKeyType:UIReturnKeyDone];
    [passWordTextField setBorderStyle:UITextBorderStyleBezel];
    [passWordTextField setSecureTextEntry:YES];
    [passWordTextField setClearButtonMode:UITextFieldViewModeWhileEditing];
    
    [self.view addSubview:passWordTextField];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

//Método que se llama antes de mostrar el teclado. Si devuelve NO no se muestra el teclado. En siguientes artículos explicaremos posibles situaciones.
- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
    return YES;
}

//Método que se llama justo antes de mostrar el teclado
- (void)textFieldDidBeginEditing:(UITextField *)textField
{

}

//Método que se llama cuando se termina de editar desde el teclado
- (BOOL)textFieldShouldEndEditing:(UITextField *)textField
{
    return YES;
}

- (void)textFieldDidEndEditing:(UITextField *)textField
{

}

//Método que se llama cuando se introducae algún valor por teclado
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    return YES;
}

//Método que se llama al borrar
- (BOOL)textFieldShouldClear:(UITextField *)textField
{
    if([textField isEqual:mailTextField])
        [mailTextField setText:@""];
        
    else if(textField == passWordTextField)
        passWordTextField.text = @"";
    return NO;
}

//Método que se llama cuando pulsamos el botón de retorno
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [nameTextField resignFirstResponder];//indicamos al teclado que desaparezca
    
    return YES;
}

@end
