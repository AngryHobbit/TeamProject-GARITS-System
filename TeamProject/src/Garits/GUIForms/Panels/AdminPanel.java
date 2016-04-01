/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Garits.GUIForms.Panels;

/**
 *
 * @author ZX-MAC
 */
public class AdminPanel extends javax.swing.JPanel {

    /**
     * Creates new form Admin
     */
    public AdminPanel() {
        initComponents();
    }

    /**
     * This method is called from within the constructor to initialize the form.
     * WARNING: Do NOT modify this code. The content of this method is always
     * regenerated by the Form Editor.
     */
    @SuppressWarnings("unchecked")
    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:initComponents
    private void initComponents() {

        AccountLabel = new javax.swing.JLabel();
        jLabel1 = new javax.swing.JLabel();
        Accounts = new javax.swing.JPanel();
        AddUser = new javax.swing.JButton();
        FindUser = new javax.swing.JButton();
        RemoveUser = new javax.swing.JButton();
        Database = new javax.swing.JPanel();
        BackUpButton = new javax.swing.JButton();
        RestoreButton = new javax.swing.JButton();
        ArchiveButton = new javax.swing.JButton();

        setPreferredSize(new java.awt.Dimension(590, 390));
        setLayout(new org.netbeans.lib.awtextra.AbsoluteLayout());

        AccountLabel.setFont(new java.awt.Font("Lucida Grande", 0, 15)); // NOI18N
        AccountLabel.setText("Accounts");
        add(AccountLabel, new org.netbeans.lib.awtextra.AbsoluteConstraints(10, 10, 90, -1));

        jLabel1.setFont(new java.awt.Font("Lucida Grande", 0, 15)); // NOI18N
        jLabel1.setText("Database");
        add(jLabel1, new org.netbeans.lib.awtextra.AbsoluteConstraints(10, 170, -1, -1));

        Accounts.setBorder(javax.swing.BorderFactory.createEtchedBorder());
        Accounts.setPreferredSize(new java.awt.Dimension(369, 126));

        AddUser.setText("Add User");

        FindUser.setText("Find User");

        RemoveUser.setText("Remove User");
        RemoveUser.setPreferredSize(new java.awt.Dimension(125, 30));

        javax.swing.GroupLayout AccountsLayout = new javax.swing.GroupLayout(Accounts);
        Accounts.setLayout(AccountsLayout);
        AccountsLayout.setHorizontalGroup(
            AccountsLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(AccountsLayout.createSequentialGroup()
                .addGap(158, 158, 158)
                .addGroup(AccountsLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING, false)
                    .addComponent(RemoveUser, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                    .addComponent(FindUser, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                    .addComponent(AddUser, javax.swing.GroupLayout.PREFERRED_SIZE, 150, javax.swing.GroupLayout.PREFERRED_SIZE)))
        );
        AccountsLayout.setVerticalGroup(
            AccountsLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(AccountsLayout.createSequentialGroup()
                .addGap(18, 18, 18)
                .addComponent(AddUser)
                .addGap(1, 1, 1)
                .addComponent(FindUser)
                .addGap(1, 1, 1)
                .addComponent(RemoveUser, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
        );

        add(Accounts, new org.netbeans.lib.awtextra.AbsoluteConstraints(10, 30, 480, 127));

        Database.setBorder(javax.swing.BorderFactory.createEtchedBorder());

        BackUpButton.setText("BackUp");
        BackUpButton.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                BackUpButtonActionPerformed(evt);
            }
        });

        RestoreButton.setText("Restore");

        ArchiveButton.setText("Archive");

        javax.swing.GroupLayout DatabaseLayout = new javax.swing.GroupLayout(Database);
        Database.setLayout(DatabaseLayout);
        DatabaseLayout.setHorizontalGroup(
            DatabaseLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(DatabaseLayout.createSequentialGroup()
                .addGap(161, 161, 161)
                .addGroup(DatabaseLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING, false)
                    .addComponent(ArchiveButton, javax.swing.GroupLayout.DEFAULT_SIZE, 150, Short.MAX_VALUE)
                    .addGroup(DatabaseLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING, false)
                        .addComponent(BackUpButton, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                        .addComponent(RestoreButton, javax.swing.GroupLayout.DEFAULT_SIZE, 150, Short.MAX_VALUE)))
                .addContainerGap(165, Short.MAX_VALUE))
        );
        DatabaseLayout.setVerticalGroup(
            DatabaseLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(DatabaseLayout.createSequentialGroup()
                .addGap(17, 17, 17)
                .addComponent(BackUpButton)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addComponent(RestoreButton)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addComponent(ArchiveButton)
                .addContainerGap(10, Short.MAX_VALUE))
        );

        add(Database, new org.netbeans.lib.awtextra.AbsoluteConstraints(10, 190, 480, 130));
    }// </editor-fold>//GEN-END:initComponents

    private void BackUpButtonActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_BackUpButtonActionPerformed
        // TODO add your handling code here:
    }//GEN-LAST:event_BackUpButtonActionPerformed


    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JLabel AccountLabel;
    private javax.swing.JPanel Accounts;
    private javax.swing.JButton AddUser;
    private javax.swing.JButton ArchiveButton;
    private javax.swing.JButton BackUpButton;
    private javax.swing.JPanel Database;
    private javax.swing.JButton FindUser;
    private javax.swing.JButton RemoveUser;
    private javax.swing.JButton RestoreButton;
    private javax.swing.JLabel jLabel1;
    // End of variables declaration//GEN-END:variables
}