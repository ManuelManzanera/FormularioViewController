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

@property (nonatomic, strong) UIButton *loginButton;

@end

@implementation ViewController

@synthesize nameTextField, mailTextField, passWordTextField, loginButton;

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
    
    loginButton = [[UIButton alloc] initWithFrame:CGRectMake(0., 0., 100., 30.)];
    [loginButton setCenter:CGPointMake(self.view.center.x, passWordTextField.center.y + passWordTextField.frame.size.height + loginButton.frame.size.height)];
    [loginButton setTitle:NSLocalizedString(@"Check", nil) forState:UIControlStateNormal];
    [loginButton setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [loginButton addTarget:self action:@selector(checkAction) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:loginButton];
    
}

- (void)checkAction
{
    if([self checkFields])
        NSLog(@"Todo OK");
}

- (BOOL)checkFields
{
    if(nameTextField.text.length == 0)
    {
        [self presentAlertViewWithMessage:NSLocalizedString(@"El campo nombre no puede estar vacío.", nil)];
        return false;
    }
    if(nameTextField.text.length > 20)
    {
        [self presentAlertViewWithMessage:NSLocalizedString(@"El campo nombre no puede superar los 20 caracteres.", nil)];
        return false;
    }
    if(passWordTextField.text.length == 0)
    {
        [self presentAlertViewWithMessage:NSLocalizedString(@"El campo password no puede estar vacío.", nil)];
        return false;
    }
    if(passWordTextField.text.length > 6)
    {
        [self presentAlertViewWithMessage:NSLocalizedString(@"El campo password no puede superar los 6 caracteres.", nil)];
        return false;
    }
    if(mailTextField.text.length == 0)
    {
        [self presentAlertViewWithMessage:NSLocalizedString(@"El campo email no puede estar vacío.", nil)];
        return false;
    }
    if(mailTextField.text.length > 50)
    {
        [self presentAlertViewWithMessage:NSLocalizedString(@"El campo email no puede superar los 50 caracteres.", nil)];
        return false;
    }
    
    return true;
}

- (void)presentAlertViewWithMessage:(NSString *)message
{
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"iOS en español" message:message delegate:nil cancelButtonTitle:NSLocalizedString(@"Aceptar", nil) otherButtonTitles:nil, nil];
    [alertView show];
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
    NSUInteger newLength;
    
    newLength = [textField.text length] + [string length] - range.length;
    
    if([textField isEqual:nameTextField])
        return (newLength > 20) ? NO : YES;
    if([textField isEqual:mailTextField])
        return (newLength > 50) ? NO : YES;
    if([textField isEqual:passWordTextField])
        return (newLength > 6) ? NO : YES;

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
